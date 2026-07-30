import MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MarkovSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  sigmaAlgebra : MeasurableSpace carrier
  probabilityMeasure : Measure carrier

structure MarkovAdmittedObject where
  stateSpace : MarkovSpace
  initialDistribution : Measure (stateSpace.carrier)
  transitionKernel : stateSpace.carrier → Measure (stateSpace.carrier)
  satisfiesMarkovProperty : Prop
  hypothesisTrue : Prop
  conclusion : hypothesisTrue

def MarkovWitnessClosed (O : MarkovAdmittedObject) : Prop :=
  O.hypothesisTrue

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse