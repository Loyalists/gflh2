// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "";
    self.team = "allies";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 100;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "beretta";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 7 ) )
    {
        case 0:
            self.weapon = "scar_h_acog";
            break;
        case 1:
            self.weapon = "scar_h_reflex";
            break;
        case 2:
            self.weapon = "scar_h_shotgun";
            break;
        case 3:
            self.weapon = "scar_h_grenadier";
            break;
        case 4:
            self.weapon = "iw5_ak12_sp";
            break;
        case 5:
            self.weapon = "iw5_hbra3_sp";
            break;
        case 6:
            self.weapon = "iw5_bal27_sp";
            break;
    }

    character\gfl\randomizer_us_army::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    character\gfl\randomizer_us_army::precache();
    precacheitem( "scar_h_acog" );
    precacheitem( "scar_h_reflex" );
    precacheitem( "scar_h_shotgun" );
    precacheitem( "scar_h_shotgun_attach" );
    precacheitem( "scar_h_grenadier" );
    precacheitem( "scar_h_m203" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
