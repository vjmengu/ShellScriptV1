SOURCE_DIR=$1
Destination_DIR=$2
DAYS=${3:-14}

logfolder="/home/ec2-user/shell-logs"
logname=$(echo $0 | awk -F "/" '{print $NF}'|cut -d "." -f1)
timestamp=$(date +%Y-%m-%d-%H-%M-%S)
logfile="$logfolder/$logname-$timestamp.log"


USAGE(){
    echo "USAGE:: backup <source directiory> <destination diretory> <days(optional)>"
    exit 1
}
mkdir -p /home/ec2-user/shell-logs
if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo " enter a vaild source directory"
    exit 1
fi

if  [ ! -d $Destination_DIR ]
then
    echo "enter a vaild destination directory"
    exit 1
fi

echo "script executino starts at $timestamp"

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -n "$FILES" ]
then
    echo " Files to zip are $FILES"
    ZIP_FILE="$Destination_DIR/app-log-$timestamp.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
    then
        echo " successfully zipped the files"
        while -r filename
        do 

        echo "deleting $filename"
        rm -rf $filename
        echo "deleted $filename"
        done <<< $FILES
    else
        echo " zipping unsuccessful"
    fi
else
    echo " There are no files to zip"
fi