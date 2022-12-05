// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_riot_op_airborne" );
    self attach( "head_riot_op_airborne", "", 1 );
    self.headmodel = "head_riot_op_airborne";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_riot_op_airborne" );
    precachemodel( "head_riot_op_airborne" );
}
