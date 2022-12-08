package inet.mobility.single;

import inet.mobility.base.MovingMobilityBase;

//
// Moves the node around a circle.
//
// @author Andras Varga
//
simple SUMOMobility extends MovingMobilityBase
{
    parameters:
        double x @unit(m) = default(10m); 
        double y @unit(m) = default(10m); 
        double z @unit(m) = default(0m); 
        double speed @unit(mps) = default(0mps); 
        @class(SUMOMobility);
}

