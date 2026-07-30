import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure StrongLawLargeNumbersPackage (S : Type u) [MeasurableSpace S] [NormedAddCommGroup S] [BorelSpace S] where
  sequence : ℕ → S
  functionSeq : ℕ → (S → ℝ)
  almostSureConvergence : Prop
  limit : S → ℝ
  integrability : Prop

structure StrongLawLargeNumbersEvidence (S : Type u) [MeasurableSpace S] [NormedAddCommGroup S] [BorelSpace S] (L : StrongLawLargeNumbersPackage S) where
  almostSureConvergenceClosed : L.almostSureConvergence
  limitClosed : Prop
  integrabilityClosed : L.integrability

def StrongLawLargeNumbersClosed (S : Type u) [MeasurableSpace S] [NormedAddCommGroup S] [BorelSpace S] (L : StrongLawLargeNumbersPackage S) : Prop :=
  L.almostSureConvergence ∧ L.integrability

theorem strong_law_large_numbers_closed_from_evidence (S : Type u) [MeasurableSpace S] [NormedAddCommGroup S] [BorelSpace S] (L : StrongLawLargeNumbersPackage S) (E : StrongLawLargeNumbersEvidence S L) : StrongLawLargeNumbersClosed S L := by
  exact And.intro E.almostSureConvergenceClosed E.integrabilityClosed

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse