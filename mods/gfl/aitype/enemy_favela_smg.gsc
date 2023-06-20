// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "common_rambo_anims.csv";
    self.team = "axis";
    self.type = "human";
    self.subclass = "militia";
    self.accuracy = 0.12;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "glock";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 3 ) )
    {
        case 0:
            self.weapon = "uzi";
            break;
        case 1:
            self.weapon = "mp5";
            break;
        case 2:
            self.weapon = "iw5_mp11_sp";
            break;
    }

    character\gfl\randomizer_favela_smg::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_favela_smg::precache();
    precacheitem( "uzi" );
    precacheitem( "mp5" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
    maps\_rambo::main();
}
