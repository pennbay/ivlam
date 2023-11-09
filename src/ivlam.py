from . import _ivlam
# TODO: 封装所有_ivlam函数

def getdirection(prograde, rveca, rvecb):
    """
    This function converts prograde/retrograde to the d variable 

    Parameters
    ----------
    prograde: bool : if true/false, the output d represents prograde/retrograde solution 
    rveca: input rank-1 array('f') with bounds (3): The initial position vector.
    rvecb: input rank-1 array('f') with bounds (3): The final position vector.

    Returns:
    -------
    d: The direction of travel. d=1 is 0<=theta<=pi, d=-1 i is pi<theta<2pi
    """
    return _ivlam.ivlam_getdirection(prograde, rveca, rvecb)

def getkandtbysbottomslow(absn,tau):
    """
    This function provides the k and T/S at the bottom of the multirev time curve
    Not called by any other routines, the routine is provided as a supplement in case a user wants the exact solution at the bottom
    The slow label is there to indicate it may not be tuned for speed, but is accurate as possible, however it is not particularly slow. 
    the approach requires one interpolation look up plus iterations on a function value until convergence.

    Parameters
    ----------
    absn : input int
    tau : input float

    Returns
    -------
    kbottom : float
    tbysbot : float
    info : int
    """
    return _ivlam.ivlam_getkandtbysbottomslow(absn,tau)