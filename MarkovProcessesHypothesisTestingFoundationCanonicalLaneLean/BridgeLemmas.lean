import MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse