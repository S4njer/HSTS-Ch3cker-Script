# HSTS-Ch3cker-Script
This Bash script allows you to check for the presence of "HTTP Strict Transport Security (HSTS)" in a list of IP addresses. It performs repeated curl requests for both HTTP and HTTPS connections to each IP address and saves the results in a file. The script also applies colors to the output messages using ANSI escape sequences.

![hsts](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.acunetix.com%2Fwp_content%2Fuploads%2F2019%2F05%2Fhsts.png&f=1&nofb=1&ipt=b6795ce5bbf04d5eb89f0002e8f2ff8576426302c0dc9cc641b324a33053c89c&ipo=images)

## Usage
Create a file named direcciones.txt and add the IP addresses you want to check, with each IP address on a new line.
1. Open the script file and locate the following variables:

~~~bash
archivo_direcciones="direcciones.txt"
archivo_resultados="resultados.txt"
~~~
1. Modify the value of archivo_direcciones if you want to use a different file name or path for the IP addresses file.
2. Modify the value of archivo_resultados if you want to use a different file name or path for the results file.
3. Save the changes to the script file.

**Open a terminal and navigate to the directory where the script file is located.**

Run the script using the following command:

~~~bash
bash script.sh
~~~
The script will start checking the HSTS for each IP address in the direcciones.txt file and display the results in the terminal. The results will also be saved in the resultados.txt file.

Once the script finishes, you can open the resultados.txt file to view the detailed results.

> **Note**: The script assumes that you have the curl command installed on your system. If not, you can install it using package managers like apt (for Debian-based systems) or yum (for Red Hat-based systems).

To configure the script according to your needs, you can follow these steps:

Adjust the values of archivo_direcciones and archivo_resultados variables to specify the desired file names or paths.

Customize the script's logic if you want to add additional checks or modify the output format.

Save the changes to the script file.

By adapting the script, you can tailor it to fit your specific requirements and perform HSTS checks on the IP addresses of your choice.
