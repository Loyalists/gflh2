// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "sniper_glint_and_rambo.csv";
    self.team = "axis";
    self.type = "human";
    self.subclass = "militia";
    self.accuracy = 0.15;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "glock";

    if ( isai( self ) )
    {
        self setengagementmindist( 1250.0, 1024.0 );
        self setengagementmaxdist( 1600.0, 2400.0 );
    }

    // self.weapon = "dragunov";
    switch ( codescripts\character::get_random_weapon( 3 ) )
    {
        case 0:
            self.weapon = "dragunov";
            break;
        case 1:
            self.weapon = "iw5_mors_sp";
            break;
        case 2:
            self.weapon = "iw5_gm6_sp";
            break;
    }

    character\gfl\randomizer_favela_sniper::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_favela_sniper::precache();
    _id_CE83::precache();
    _id_B17F::precache();
    precacheitem( "dragunov" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
    maps\_rambo::main();
    maps\_sniper_glint::main();
}
