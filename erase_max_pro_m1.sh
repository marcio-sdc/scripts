sudo fastboot devices

REQUIRED_PACKAGES="android-sdk android-tools-adb wget"

OS_LINK="https://download.pixelexperience.org/get/bllJU09JOE1hVzBDY0cxKy9QalBjSXRxWXdwOXBBVXZsVnU3VHI3OHMrS2NjK3pyODRBWU95WmMyRElYWUpFUVY3Tno1ckpYYzNRT096b1J3ZHptYlVrcnpqaHl5NDNyemsxL1o2YzQ5R2s3MU5PdnVoU01YZEdLMDVtVGRHVmo="

OS_FILE_NAME="PixelExperience_Plus_X00TD-11.0-20210717-1657-OFFICIAL.zip"

TWRP_LINK="https://kudnet.id/downloads/twrp/X00T/twrp-3.4.0-0-KudProject-X00T.img"

TWRP_FILE_NAME="twrp-3.4.0-0-KudProject-X00T.img"

PARTITIONS_TO_FORMAT="boot system odm recovery cache misc userdata metadata vendor radio tos"

sudo apt-get install -y $REQUIRED_PACKAGES

if ! [ -f "$OS_FILE_NAME" ]; then
	wget --content-disposition $OS_LINK; else
	echo "OS file already exists!"
fi

if ! [ -f "$TWRP_FILE_NAME" ]; then
	wget --content-disposition $TWRP_LINK; else
	echo "TWRP file already exists!"
fi

for partition in $PARTITIONS
do
	echo "Formatting $partition..."
	sudo fastboot erase $partition
done

sudo fastboot flash recovery $TWRP_FILE_NAME

