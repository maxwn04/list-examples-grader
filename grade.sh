CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
if[[-f ListExamples.java]]
then
    echo "Files Found"
else
    echo "Files not Found"
    exit
fi
echo "Finished cloning"
cp student-submission/ListExamples.java `pwd`
