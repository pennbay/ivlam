!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  
    module ivLamIOmod
    !This module is global to define kind of reals and integers, and provide print units to output files
    use, intrinsic :: iso_fortran_env
    
    integer(kind=2):: prntU=6           !the print unit for progress, warnings and errors, typically sent to screen.  Set to 6 for screen, any other number will print to a file ivLam_Log.txt 
    
    !----------------------------------
    !toggle between one or the other of the following two lines, use the first nominally, but if your compiler doesnt support, just use the second
    integer(kind=2),parameter:: r16=real128 ,r8=real64 ,r4=real32 , i1=int8, i2=int16, i4=int32, i8=int64   !these are simple parameters to serve as proxies and are set in stone. 
    !integer(kind=2),parameter:: r16=16     ,r8=8       ,r4=4      , i1=1   , i2=2    , i4=4    , i8=8       !
    !----------------------------------
                                       !i1 (-128 to 127), i2 is (-32,768 to +32,767), *4 is INT32 (-2147483648 to 2147483647 ) and default for int, i8 (-+9.22 x 10^18)      
                                       !r4 (single precision), r8 (double precision) and default for real, r16 (quad precision)      
                                       !ALL LOGICALS in code are the Fortran default kind (which is 4 currently), so no kind is explicitly mentioned in variable definitions    
    integer(kind=2),parameter:: iu=i4   !working precision for integers in the code, inputs and outputs (do not change from i4)
    integer(kind=2),parameter:: ru=r8   !working precision for reals in the code, inputs and outputs (intended to be r8, also can work with r16 but may need further testing)
    
    integer(kind=2),parameter:: igs=i2  !working precision for integers in the interpolation and initial guess for k (do not change from i2)
    integer(kind=2),parameter:: rgs=r8  !working precision for reals in the interpolation and initial guess for k (do not change from r8)
    
    end module 

!========================================================================================================================================================================================       
    subroutine ivLam_getDirection(prograde,rveca,rvecb,d)  
    !this routine converts prograde/retrograde to the d variable 
    use ivLamIOmod
    implicit none
    logical,intent(in):: prograde !logical, if true/false, the output d represents prograde/retrograde solution 
    integer(kind=iu),intent(out):: d     !d=1 is 0<=theta<=pi, d=-1 i is pi<theta<2pi
    real(kind=ru),intent(in):: rveca(3),rvecb(3) !initial and terminal Cartesian position vectors

    real(kind=ru) h3
        
    h3=rveca(1)*rvecb(2)-rveca(2)*rvecb(1)
    if (h3>0.d0) then
        d=1
    else
        d=-1
    endif
    if(prograde.eqv.(.false.)) d=d*(-1)
    end subroutine