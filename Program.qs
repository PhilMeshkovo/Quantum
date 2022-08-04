namespace Quantum {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;

    @EntryPoint()
    operation loop() : Unit {
         for index in 0 .. 15 {
            let(Re0, Re1, Re2) = zzz();
            Message($"{Re0},{Re1},{Re2}");
         }   
    }

    operation zzz() : (Int, Int, Int) 
    {
        mutable Re0 = 0;
        mutable Re1 = 0;
        mutable Re2 = 0;

        use q1 = Qubit();
        use q2 = Qubit();
        use q3 = Qubit();

        H(q1);
        H(q2);

        CCNOT(q1, q2, q3); //Связка кубитов логическим И

        if(M(q1) == One) {set Re0 = 1;}
        if(M(q2) == One) {set Re1 = 1;}
        if(M(q3) == One) {set Re2 = 1;}
        return (Re0, Re1, Re2);  
    }
}
