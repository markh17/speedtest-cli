(*
  SpeedTest GUI for running internet speed tests
    Copyright (C) 2015  Mark Hedrick, Levi Muniz

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*)
#Written By Mark Hedrick & Levi Muniz
#Version 0.1
#Counter
property runcounter : 0

#Prompt
display dialog "Do you wish to run a speedtest?" buttons {"Yes", "No"} with title "SpeedTest GUI by Mark Hedrick & Levi Muniz"
#Start Loop
if the button returned of the result is "Yes" then
	#Initial Run
	display dialog "Running a speedtest!" with title "SpeedTest GUI by Mark Hedrick"
	do shell script "cd /tmp && curl -O -L https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py && chmod +x speedtest_cli.py"
	set speedtest to "python /tmp/speedtest_cli.py --simple"
	set speedtest to do shell script speedtest
	set runcounter to runcounter + 1
	#2nd time
	repeat
		display dialog speedtest buttons {"Re-test", "Exit"} with title "SpeedTest GUI Results | Run Count: " & runcounter
		if the button returned of the result is "Re-Test" then
			display dialog "Running a speedtest!" with title "SpeedTest GUI by Mark Hedrick"
			set speedtest to "python /tmp/speedtest_cli.py --simple"
			set speedtest to do shell script speedtest
			set runcounter to runcounter + 1
		else
			return 0
		end if
	end repeat
else
	return 0
end if
