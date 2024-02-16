echo -e '\n1. What is in this directory ?\n'
ls -a

echo -e '\n2. What is the version of Java ?\n'
java --version

echo -e '\n3. What is the version of gcc ?\n'
gcc --version

echo -e '\n4. What is the workspace location ?\n'
echo $RUNNER_WORKSPACE

echo -e '\n5. What environment variables are available ?\n'
env

echo -e '\n6. Who is the user ?\n'
whoami