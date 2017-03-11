#!/usr/bin/bash
#         Author:		John Coty Embry
#   Date Created:		10-29-2016
#  Last Modified:		10-29-2016
#Program comment: 		This will take input that is of the following form:
#
#	started development: Mon Oct 17 19:37:58 CDT 2016
#	ended development: Mon Oct 17 19:49:44 CDT 2016
#	
#	started development: Mon Oct 17 20:09:19 CDT 2016
#	ended development: Mon Oct 17 20:36:41 CDT 2016
#	
#	started development: Mon Oct 17 20:40:15 CDT 2016
#	ended development: Mon Oct 17 21:36:34 CDT 2016
#	started development: Tue Oct 18 22:50:48 CDT 2016
#	ended development: Wed Oct 19 00:05:35 CDT 2016
#
#and add up the timesheet times up

startFlag=0

hours=0
minutes=0
seconds=0
currentHours=0
currentMinutes=0
currentSeconds=0
priorHours=0
priorMinutes=0
priorSeconds=0
timeTotal=0


(
	while read line; do
		# echo $line



		lineFlag=`echo $line | cut -d ' ' -f1`
		fullTime=`echo $line | cut -d ' ' -f6`
		currentHours=`echo $fullTime | cut -d ':' -f1`
		currentMinutes=`echo $fullTime | cut -d ':' -f2`
		currentSeconds=`echo $fullTime | cut -d ':' -f3`


		# if ((0 == $end)); then
		# 	echo $lineFlag
		# 	echo "end == $end"
		# fi

		if(($startFlag == 0)); then
			#if here then this is the first iteration through
			priorHours=$currentHours
			priorMinutes=$currentMinutes
			priorSeconds=$currentSeconds



			startFlag=1
		else
			if [ "$lineFlag" == "started" ]; then
				priorHours=$currentHours
				priorMinutes=$currentMinutes
				priorSeconds=$currentSeconds
			elif [ "$lineFlag" == "ended" ]; then
				#compare the last time with this time
				# echo "$currentHours - $priorHours"
				# hourDifference=$((currentHours - priorHours))
				# hours=$((hours + hourDifference))
				# echo $hours > './___hours___.txt'
			
			
				# the follwing code might work for the dates in the following form:
				# 	Thu Mar 5 09:15:27 2015
				# printf "%s\n" $(( $(date -d "$date2" "+%s") - $(date -d "$date1" "+%s") ))


			fi



			#set these back up for the next iteration
			# priorHours=currentHours
			# priorMinutes=currentMinutes
			# priorSeconds=currentSeconds
		fi

		# echo $hours

	done 
) < ./timesheetTest.md

cat './___hours___.txt'

rm './___hours___.txt'

