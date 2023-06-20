// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "common_rambo_anims.csv";
    self.team = "axis";
    self.type = "human";
    self.subclass = "militia";
    self.accuracy = 0.18;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "glock";

    if ( isai( self ) )
    {
        self setengagementmindist( 0.0, 0.0 );
        self setengagementmaxdist( 280.0, 400.0 );
    }

    switch ( codescripts\character::get_random_weapon( 3 ) )
    {
        case 0:
            self.weapon = "model1887";
            break;
        case 1:
            self.weapon = "ranger";
            break;
        case 2:
            self.weapon = "iw5_uts19_sp";
            break;
    }

    character\gfl\randomizer_favela_lmg::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_favela_lmg::precache();
    precacheitem( "model1887" );
    precacheitem( "ranger" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
    maps\_rambo::main();
}
