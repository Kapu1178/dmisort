/mob/verb/dmisort(icon as file)
	if(copytext_char("[icon]", -4) != ".dmi")
		usr << copytext_char("[icon]", -4)
		CRASH("Non-DMI file sent to dmisort")
	if(!isicon(icon))
		CRASH("Non-existant file path sent to dmisort")

	usr << "DMI Accepted"
	var/list/icon_map = list()

	for(var/state in icon_states(icon))
		icon_map[state] = icon(icon, state)

	sortTim(icon_map, /proc/cmp_text_asc)

	var/icon/new_dmi = icon()
	for(var/state in icon_map)
		new_dmi.Insert(icon_map[state], state)


	var/list/splitpath = splittext("[icon]", "/")
	var/new_name = "SORTED_[splitpath[splitpath.len]]"
	fcopy(new_dmi, "out/[new_name]")
	usr << "File outputted to out/[new_name]"
