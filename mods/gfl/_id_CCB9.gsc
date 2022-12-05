// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_shadow_co_smg" );
    self attach( "head_shadow_co_c", "", 1 );
    self.headmodel = "head_shadow_co_c";
    self.voice = "shadowcompany";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_shadow_co_smg" );
    precachemodel( "head_shadow_co_c" );
}
