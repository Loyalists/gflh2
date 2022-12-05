// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_shadow_co_smg" );
    codescripts\character::attachhead( "alias_shad_co_heads", _id_CEEA::main() );
    self.voice = "shadowcompany";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_shadow_co_smg" );
    codescripts\character::precachemodelarray( _id_CEEA::main() );
}
