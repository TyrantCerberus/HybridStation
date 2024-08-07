/datum/job/lab_technician
	title = "Lab Technician"
	trainee_role = TRUE
	department_head = list("Research Director")
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the research director and senior researchers"
	selection_color = "#ffeeff"

	outfit = /datum/outfit/job/lab_technician
	plasmaman_outfit = /datum/outfit/plasmaman/science

	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SCI

	display_order = JOB_DISPLAY_ORDER_LAB_TECHNICIAN
	bounty_types = CIV_JOB_SCI
	departments = DEPARTMENT_SCIENCE

	family_heirlooms = list(/obj/item/toy/plush/slimeplushie)

	mail_goodies = list(
		/obj/item/raw_anomaly_core/random = 10,
		/obj/item/disk/tech_disk/spaceloot = 2,
		/obj/item/camera_bug = 1
	)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE


/datum/outfit/job/lab_technician
	name = "Lab Technician"
	jobtype = /datum/job/lab_technician
	card_access = /datum/card_access/job/lab_technician

	belt = /obj/item/pda/toxins
	ears = /obj/item/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/color/lightpurple
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit = /obj/item/clothing/suit/toggle/labcoat
	l_pocket = /obj/item/pen/fourcolor
	r_pocket = /obj/item/clipboard

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox
	duffelbag = /obj/item/storage/backpack/duffelbag/toxins
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/science=1)

/datum/outfit/job/lab_technician/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(0.4))
		neck = /obj/item/clothing/neck/tie/horrible
