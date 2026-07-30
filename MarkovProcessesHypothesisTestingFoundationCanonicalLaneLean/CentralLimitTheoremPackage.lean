import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure CentralLimitTheoremPackage (S : Type u) [MeasurableSpace S] [NormedAddCommGroup S] [BorelSpace S] where
  sequence : ℕ → S
  normalization : ℕ → ℝ
  limitingDistribution : Measure S
  convergenceInDistribution : Prop
  finiteVariance : Prop

structure CentralLimitTheoremEvidence (S : Type u) [MeasurableSpace S] [NormedAddCommGroup S] [BorelSpace S] (C : CentralLimitTheoremPackage S) where
  convergenceInDistributionClosed : C.convergenceInDistribution
  finiteVarianceClosed : C.finiteVariance
  limitingDistributionClosed : C.limitingDistribution = (Measure.dirac 0)

def CentralLimitTheoremClosed (S : Type u) [MeasurableSpace S] [NormedAddCommGroup S] [BorelSpace S] (C : CentralLimitTheoremPackage S) : Prop :=
  C.convergenceInDistribution ∧ C.finiteVariance

theorem central_limit_theorem_closed_from_evidence (S : Type u) [MeasurableSpace S] [NormedAddCommGroup S] [BorelSpace S] (C : CentralLimitTheoremPackage S) (E : CentralLimitTheoremEvidence S C) : CentralLimitTheoremClosed S C := by
  exact And.intro E.convergenceInDistributionClosed E.finiteVarianceClosed

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse