
#ifndef __INET_SUMOMOBILITY_H
#define __INET_SUMOMOBILITY_H

#include "inet/common/INETDefs.h"
#include "inet/mobility/base/MovingMobilityBase.h"

namespace inet {

class INET_API SUMOMobility : public MovingMobilityBase
{
  protected:
    double x;
    double y;
    double z;
    double speed;


  protected:
    virtual int numInitStages() const override { return NUM_INIT_STAGES; }
    virtual void initialize(int stage) override;
    virtual void setInitialPosition() override;
    virtual void move() override;

  public:
    virtual double getMaxSpeed() const override { return speed; }
    SUMOMobility();

};

} 

#endif // ifndef __INET_SUMOMOBILITY_H

