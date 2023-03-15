//TimSort interface
/proc/sortTim(list/L, cmp=/proc/cmp_text_asc, associative, fromIndex=1, toIndex=0)
	if(L && L.len >= 2)
		fromIndex = fromIndex % L.len
		toIndex = toIndex % (L.len+1)
		if(fromIndex <= 0)
			fromIndex += L.len
		if(toIndex <= 0)
			toIndex += L.len + 1

		var/sort_instance/SI = global.sortInstance
		if(!SI)
			SI = new

		SI.L = L
		SI.cmp = cmp
		SI.associative = associative

		SI.timSort(fromIndex, toIndex)
	return L
