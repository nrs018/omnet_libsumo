
#include "inet/common/INETMath.h"
#include "inet/mobility/single/SUMOMobility.h"
#include "libsumo/libsumo.h"

namespace inet {

Define_Module(SUMOMobility);

SUMOMobility::SUMOMobility()
{
    x = 0;
    y = 0;
    z = 0;
    speed = 0;
}

void SUMOMobility::initialize(int stage)
{
    MovingMobilityBase::initialize(stage);

    EV_TRACE << "initializing SUMOMobility stage " << stage << endl;
    if (stage == INITSTAGE_LOCAL) {
        x = par("x");
        y = par("y");
        z = par("z");
        speed = par("speed");
    }
}

void SUMOMobility::setInitialPosition()
{
    move();
}

void SUMOMobility::move()
{

    std::string vehID = this->getParentModule()->getName() + std::to_string(this->getParentModule()->getIndex());
    try{
        libsumo::TraCIPosition pos = libsumo::Vehicle::getPosition(vehID);
//        std::cout << vehID << " " << pos.x << " " << pos.y << endl;
        lastPosition.x = pos.x;
        lastPosition.y = pos.y;
        lastPosition.z = 0;
        lastVelocity.x = speed;
        lastVelocity.y = speed;
        lastVelocity.z = 0;
    }

    catch(libsumo::TraCIException & e){
//        std::cout << e.what() << ", " << this->getFullName() << endl;
    }
}

} // namespace inet

