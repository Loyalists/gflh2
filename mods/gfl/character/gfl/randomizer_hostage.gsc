main()
{
	character\gfl\_utility::detach_all_attachments();

	switch( codescripts\character::get_random_character(17) )
	{
	case 0:
		_id_BF3A::main();
		break;
	case 1:
		_id_B05D::main();
		break;
	case 2:
		_id_D1CB::main();
		break;
	case 3:
		_id_AE73::main();
		break;
	case 4:
		_id_B09C::main();
		break;
	case 5:
		_id_D452::main();
		break;
	case 6:
		character\gfl\character_gfl_p90::main();
		break;
	case 7:
		character\gfl\character_gfl_9a91::main();
		break;
	case 8:
		character\gfl\character_gfl_rfb::main();
		break;
	case 9:
		character\gfl\character_gfl_type97::main();
		break;
	case 10:
		character\gfl\character_gfl_saiga12::main();
		break;
	case 11:
		character\gfl\character_gfl_fnc::main();
		break;
	case 12:
		character\gfl\character_gfl_sten::main();
		break;
	case 13:
		character\gfl\character_gfl_ak74m::main();
		break;
	case 14:
		character\gfl\character_gfl_sp9::main();
		break;
	case 15:
		character\gfl\character_gfl_tac50::main();
		break;
	case 16:
		character\gfl\character_gfl_commander::main();
		break;
	}
	self.voice = "american";
}

precache()
{
    _id_BF3A::precache();
    _id_B05D::precache();
    _id_D1CB::precache();
    _id_AE73::precache();
    _id_B09C::precache();
    _id_D452::precache();
	character\gfl\character_gfl_p90::precache();
	character\gfl\character_gfl_9a91::precache();
	character\gfl\character_gfl_rfb::precache();
	character\gfl\character_gfl_type97::precache();
	character\gfl\character_gfl_saiga12::precache();
	character\gfl\character_gfl_fnc::precache();
	character\gfl\character_gfl_sten::precache();
	character\gfl\character_gfl_ak74m::precache();
	character\gfl\character_gfl_sp9::precache();
	character\gfl\character_gfl_tac50::precache();
	character\gfl\character_gfl_commander::precache();
}