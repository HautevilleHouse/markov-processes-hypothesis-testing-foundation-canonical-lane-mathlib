import MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.hypothesisSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse