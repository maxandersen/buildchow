# curl control of jenkins jobs based on http://benkiew.wordpress.com/2012/01/12/automating-hudsonjenkins-via-rest-and-curl-a-very-small-cookbook/

if [ $# -ne 3 ]
then
  echo "Usage: `basename $0` jenkinsurl username password"
  exit 65
fi

jenkinsurl=$1
username=$2
password=$3

echo Create all jobs
# create all jobs (if jobs already exists it will fail for those)
find target/jobs -type d -mindepth 1 | sed -e 's/target.jobs.//g'| xargs -n 1 -I {} curl -u ${username}:${password} -X POST -H "Content-Type: text/xml" --data-binary @target/jobs/{}/config.xml ${jenkinsurl}createItem?name={}

echo Update all jobs
# update all jobs (redundant)
find target/jobs -type d -mindepth 1 | sed -e 's/target.jobs.//g' | xargs -n 1 -I {} curl -u ${username}:${password} -H "Content-Type: text/xml" -d @target/jobs/{}/config.xml ${jenkinsurl}job/{}/config.xml


