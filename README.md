# read_certs
AWK script to print x509 cert and rsa key info

## Installation
`openssl` and `awk` are required to run the script. Download the script and make it executable.
Add the path to the script to your `PATH` environment variable. For example edit your `.bashrc`
file and add the following line:
```bash
export PATH=$PATH:/path/to/read_certs
```
Then run `source ~/.bashrc` to apply the changes.

## Usage
```bash
read_certs.sh <certfile|->
```
The scripts reads the file that contains list of PEM certificates or RSA keys and prints out
the information in a human readable format. It also prints out the modulus of the RSA key with
ellipsis to make it easier to compare.

The main advantage of this script is that it can read multiple certificates and keys from a single
file.

## Origins
The script used to be shared among coworkers unofficially but created a legacy I brought
to my new job.

I added a RSA key info support.
