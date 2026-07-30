import MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : MarkovAdmittedObject
  hypothesisSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : hypothesisSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object ∧ (A.hypothesisSatisfied ∨ A.remainderRecorded)

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse