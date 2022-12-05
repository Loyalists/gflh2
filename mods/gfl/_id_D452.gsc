// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_work_civ_male_c_bomb" );
    codescripts\character::attachhead( "alias_civilian_worker_heads_hostage", _id_B05E::main() );
    self.voice = "american";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_work_civ_male_c_bomb" );
    codescripts\character::precachemodelarray( _id_B05E::main() );
}
