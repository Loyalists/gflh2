main()
{
	character\gfl\_utility::detach_all_attachments();

	switch( codescripts\character::get_random_character(1) )
	{
	case 0:
		character\gfl\character_gfl_vespid::main();
		break;
	}
	self.voice = "russian";
}

precache()
{
	character\gfl\character_gfl_vespid::precache();
}