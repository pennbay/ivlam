from . import _ivlam

def getdirection(prograde, rveca, rvecb):
    """
    This function calculates the direction between two vectors.

    Parameters:
    prograde (bool): if true/false, the output d represents prograde/retrograde solution 
    rveca input rank-1 array('f') with bounds (3): The initial position vector.
    rvecb input rank-1 array('f') with bounds (3): The final position vector.

    Returns:
    d: The direction of travel. d=1 is 0<=theta<=pi, d=-1 i is pi<theta<2pi
    """
    return _ivlam.ivlam_getdirection(prograde, rveca, rvecb)