
package inet.examples.sumo;

import inet.mobility.single.SUMOMap;
import inet.node.inet.*;
import inet.physicallayer.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.common.geometry.common.SimpleGeographicCoordinateSystem;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;
import inet.visualizer.roads.SUMORoadsCanvasVisualizer;
import inet.visualizer.scene.*;

network SUMOwithOMNeT
{
    parameters:
        int numVehicle = 3; // the number of vehicle
        int numTaxi = default(0);  //the number of taxi
        int numTruck = default(0); // the number of truck
        int numBus = default(0); // the number of bus
        int numCoach = default(0); //the number of coach
        int numPassenger = default(0); // the number of passenger
        int numDelivery = default(0); // the number of delivery
        int numTrailer = default(0); // the number of trailer

        @display("bgb=650,450");
    submodules:
        roadsCanvasVisualizer: SUMORoadsCanvasVisualizer {
            @display("p=100,300");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=100,200;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=100,100;is=s");
        }

        sumomap: SUMOMap {
            numVehicle = numVehicle;
            numTruck = numTruck;
            numBus = numBus;
            numTaxi = numTaxi;
            numCoach = numCoach;
            numDelivery = numDelivery;
            numPassenger = numPassenger;
            numTrailer = numTrailer;

            @display("p=100,400");
        }
        V[numVehicle]: WirelessHost {// do not change "V"
            @display("p=243,336;i=veins/node/car");
        } 

//        Taxi[numTaxi]:WirelessHost{ // do not chane "Taxi"
//            @display("p=243,336;i=sumo/taxi");
//        }
//        C[numCoach] : WirelessHost{ // no not change "C"
//            @display("p=243,336;i=sumo/coach");
//        }
//        B[numBus] : WirelessHost{ // do not change "B"
//        	@display("p=243,336;i=sumo/bus");   
//        }
//        D[numDelivery] : WirelessHost{ // do not change "D"
//        	@display("p=243,336;i=sumo/delivery");   
//        }
//        T[numTruck] : WirelessHost{ // do not change "T"
//        	@display("p=243,336;i=sumo/truck");   
//        }
//        P[numPassenger] : WirelessHost{ // do not change "P"
//        	@display("p=243,336;i=sumo/passenger");   
//        }
//        Tr[numTrailer] : WirelessHost{ // do not change "Tr"
//        	@display("p=243,336;i=sumo/trailer");   
//        }
}
