/mob/living/silicon/robot/examine(mob/user)
	. = list("<span class='info'>*---------*\nThis is [icon2html(src, user)] \a <EM>[src]</EM>!")
	if(desc)
		. += "[desc]"

	var/obj/act_module = get_active_held_item()
	if(act_module)
		. += "It is holding [icon2html(act_module, user)] \a [act_module]."
	. += status_effect_examines()
	if (getBruteLoss())
		if (getBruteLoss() < maxHealth*0.5)
			. += span_warning("It looks slightly dented.")
		else
			. += span_warning("<B>It looks severely dented!</B>")
	if (getFireLoss() || getToxLoss())
		var/overall_fireloss = getFireLoss() + getToxLoss()
		if (overall_fireloss < maxHealth * 0.5)
			. += span_warning("It looks slightly charred.")
		else
			. += span_warning("<B>It looks severely burnt and heat-warped!</B>")
	if (health < -maxHealth*0.5)
		. += span_warning("It looks barely operational.")
	if (fire_stacks < 0)
		. += span_warning("It's covered in water.")
	else if (fire_stacks > 0)
		. += span_warning("It's coated in something flammable.")

	if(opened)
		. += span_warning("Its cover is open and the power cell is [cell ? "installed" : "missing"].")
	else
		. += "Its cover is closed[locked ? "" : ", and looks unlocked"]."

	if(cell && cell.charge <= 0)
		. += span_warning("Its battery indicator is blinking red!")

	switch(stat)
		if(CONSCIOUS)
			if(shell)
				. += "It appears to be an [deployed ? "active" : "empty"] AI shell."
			else if(!client)
				. += "<span class='warning'>It appears to be in stand-by mode and has been completely unresponsive to anything for [round(((world.time - lastclienttime) / (1 MINUTES)),1)] minutes. It may boot up again soon.</span>"
		if(SOFT_CRIT, UNCONSCIOUS, HARD_CRIT)
			. += span_warning("It doesn't seem to be responding.")
		if(DEAD)
			. += span_deadsay("It looks like its system is corrupted and requires a reset.")
	. += "*---------*</span>"

	. += ..()
