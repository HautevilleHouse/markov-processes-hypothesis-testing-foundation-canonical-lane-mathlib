import canonicalLaneMathlib.AdmissibleClass
import MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.MarkovKernelPackage
import MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.HypothesisTestPackage
import MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.StrongLawLargeNumbersPackage
import MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.CentralLimitTheoremPackage

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure MarkovTestingFoundation (S : Type u) [MeasurableSpace S] [NormedAddCommGroup S] [BorelSpace S] where
  kernelPackage : MarkovKernelPackage S
  testPackage : HypothesisTestPackage S
  strongLaw : StrongLawLargeNumbersPackage S
  centralLimit : CentralLimitTheoremPackage S

structure MarkovTestingFoundationEvidence (S : Type u) [MeasurableSpace S] [NormedAddCommGroup S] [BorelSpace S] (F : MarkovTestingFoundation S) where
  kernelEvidence : MarkovKernelEvidence S F.kernelPackage
  testEvidence : HypothesisTestEvidence S F.testPackage
  strongLawEvidence : StrongLawLargeNumbersEvidence S F.strongLaw
  centralLimitEvidence : CentralLimitTheoremEvidence S F.centralLimit

def MarkovTestingFoundationClosed (S : Type u) [MeasurableSpace S] [NormedAddCommGroup S] [BorelSpace S] (F : MarkovTestingFoundation S) : Prop :=
  MarkovKernelClosed S F.kernelPackage ∧ HypothesisTestClosed S F.testPackage ∧ StrongLawLargeNumbersClosed S F.strongLaw ∧ CentralLimitTheoremClosed S F.centralLimit

theorem markov_testing_foundation_closed_from_evidence (S : Type u) [MeasurableSpace S] [NormedAddCommGroup S] [BorelSpace S] (F : MarkovTestingFoundation S) (E : MarkovTestingFoundationEvidence S F) : MarkovTestingFoundationClosed S F := by
  have h1 : MarkovKernelClosed S F.kernelPackage := markov_kernel_closed_from_evidence S F.kernelPackage E.kernelEvidence
  have h2 : HypothesisTestClosed S F.testPackage := hypothesis_test_closed_from_evidence S F.testPackage E.testEvidence
  have h3 : StrongLawLargeNumbersClosed S F.strongLaw := strong_law_large_numbers_closed_from_evidence S F.strongLaw E.strongLawEvidence
  have h4 : CentralLimitTheoremClosed S F.centralLimit := central_limit_theorem_closed_from_evidence S F.centralLimit E.centralLimitEvidence
  exact And.intro h1 (And.intro h2 (And.intro h3 h4))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse