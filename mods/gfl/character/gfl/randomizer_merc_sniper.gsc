main()
{
	character\gfl\_utility::detach_all_attachments();

	switch( codescripts\character::get_random_character(2) )
	{
	case 0:
		character\gfl\character_gfl_jaeger::main();
		break;
	case 1:
		character\gfl\character_gfl_jaeger_goggle_up::main();
		break;
	}
	self.voice = "russian";
}

precache()
{
	character\gfl\character_gfl_jaeger::precache();
	character\gfl\character_gfl_jaeger_goggle_up::precache();
}