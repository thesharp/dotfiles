# by @knsd

on run {input, parameters}
	tell application "iTunes"
		if player state is playing then
			set myTrack to (get name of current track)
			set myArtist to (get artist of current track)
			tell application "System Events"
				keystroke ("NP: " & myArtist & " — " & myTrack)
			end tell
		end if
	end tell
end run
