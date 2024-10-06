#!/usr/bin/awk -f

BEGIN {
  if ( ARGC < 2 ) {
    print "Usage ./read_certs <filename>"
    exit
  }

  cert_idx=0;
  command="openssl x509 -text -noout -certopt no_version,no_signame,no_sigdump,no_pubkey -modulus|sed -e 's/^\\(Modulus=.\\{38\\}\\).*\\(.\\{38\\}$\\)/\\1(...)\\2/'"
  rsa_command="openssl rsa -text -noout -modulus| sed -e 's/^\\(Modulus=.\\{38\\}\\).*\\(.\\{38\\}$\\)/\\1(...)\\2/'| grep -e Private -e Modulus"
  print "----------------------------------"
}


/-----BEGIN CERTIFICATE-----/ {
  cert_data=""
  cert_idx++
}

/-----BEGIN PRIVATE KEY-----/ {
  cert_data=""
  cert_idx++
}

/-----BEGIN ENCRYPTED PRIVATE KEY-----/ {
  print "----------------------------------"
  print "Encrypted Private Key"
  print "----------------------------------"
}

{
  cert_data=cert_data "\r\n" $0
}

/-----END CERTIFICATE-----/ {
  print "Certificate #"cert_idx;
  print "----------------------------------"
  print cert_data | command
  close(command)
  print "----------------------------------"
}

/-----END PRIVATE KEY-----/ {
  print "Private Key #"cert_idx;
  print "----------------------------------"
  print cert_data | rsa_command
  close(rsa_command)
  print "----------------------------------"
}
