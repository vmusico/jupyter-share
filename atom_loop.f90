    def build_loop
    integer Natoms, cuenta, bn, an
    real*8 a0, Boxsize_x,Boxsize_y,Boxsize_z

    a0 = 2.8553
    bn = 20
    an = 10
    Natoms = 2*(bn*bn*bn)
    Boxsize_x = 2*a0
    # box size should reflect the size of the entire box. So if we are building a single unit cell
    Boxsize_y = 2*a0    
    # box, a0 is the right size. If we have more unit cells, this should be bigger.
    Boxsize_z = 2*a0    
    # We are going to build a 2x2x2 box, so each box size should be 2*a0.
    cuenta = 1

    # for good style, we should indent everything inside a loop like how I change it below. You can choose the number of spaces to indent in fortran
    # in python, it is always four spaces.

    # cuenta = 1 ! this is going to keep up with the atom number
    
    open(unit=1, file="atom_loop.txt")
    open(unit=2, file="atom_loop.xyz")
    write(1,'(i12)') Natoms
    write(2,'(i12)') Natoms
    write(1,'(3f14.6)') Boxsize_x,Boxsize_y,Boxsize_z
    write(2,*)

    do i=1,bn
    # Main problem is finding what to tell the program to do for the IF function,
    # I am unsure of what to put (I have trie NULLIFY, CONTINUE, AND WRITE) as well as the
    # placement of END IF, it works at the end near END DO with CONTINUE or after WRITE.
        write(2,'(a,3f14.6)')"Fe",(i-1)*a0,(i-0.5)*a0
        do j=1,bn
            write(2,'(a,3f14.6)')"Fe",(j-1)*a0,(j-0.5)*a0    
                do k=1,bn
                    write(2,'(a,3f14.6)')"Fe",(k-1)*a0,(k-0.5)*a0
        
    write(1,'(i12,3f14.6)') cuenta,(i-1)*a0,(j-1)*a0,(k-1)*a0 
    cuenta = cuenta+1
    write(2,'(a,3f14.6)')"H",(i-1)*a0,(j-1)*a0,(k-1)*a0
        write(1,'(i12,3f14.6)') cuenta,(i-0.5)*a0,(j-0.5)*a0,(k-0.5)*a0 
        cuenta = cuenta+1 # update the atom number
    write(2,'(a,3f14.6)')"H",(i-0.5)*a0,(j-0.5)*a0,(k-0.5)*a0

    end do

        end do

            end do
    close(1)
    close(2)

    end program build_loop


