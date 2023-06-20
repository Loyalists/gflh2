main()
{
	character\gfl\_utility::detach_all_attachments();

	switch( character\gfl\_utility::get_random_character(1) )
	{
	case 0:
		character\gfl\character_gfl_ripper::main();
		break;
	}
	self.voice = "russian";
}

precache()
{
	character\gfl\character_gfl_ripper::precache();
}