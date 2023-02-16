CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
if [[ -f student-submission/ListExamples.java ]]
then
    echo "Files Found"
else
    echo "Files not Found"
    rm -r student-submission
    exit
fi
echo 'Finished cloning'
cp student-submission/ListExamples.java `pwd`
javac -cp $CPATH *.java
if [[ $? == 1 ]]
then
    echo "Did not compile"
    rm -r student-submission
    rm ListExamples.*
    exit
fi
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > scores.txt
grep ^"Tests run: " scores.txt

rm -r student-submission
rm ListExamples.*
