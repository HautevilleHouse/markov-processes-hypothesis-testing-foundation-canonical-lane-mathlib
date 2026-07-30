import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.MarkovChainHypothesisTesting

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure LikelihoodRatioTestPackage {A : AdmissibleClass}
    {H : HypothesisTestPackage A} {M : MarkovChainTestPackage H} where
  logLikelihoodRatio : Type u
  threshold : ℝ
  asymptoticDistribution : Type v
  logLikelihoodRatioDefined : Prop
  thresholdChosen : threshold > 0
  asymptoticDistributionIdentified : Prop
  logLikelihoodRatioDefinedClosed : logLikelihoodRatioDefined
  thresholdChosenClosed : thresholdChosen
  asymptoticDistributionIdentifiedClosed : asymptoticDistributionIdentified

structure LikelihoodRatioTestEvidence {A : AdmissibleClass}
    {H : HypothesisTestPackage A} {M : MarkovChainTestPackage H}
    (L : LikelihoodRatioTestPackage H M) where
  logLikelihoodRatioDefinedEvidence : L.logLikelihoodRatioDefined
  thresholdChosenEvidence : L.thresholdChosen
  asymptoticDistributionIdentifiedEvidence : L.asymptoticDistributionIdentified

def LikelihoodRatioTestClosed {A : AdmissibleClass}
    {H : HypothesisTestPackage A} {M : MarkovChainTestPackage H}
    (L : LikelihoodRatioTestPackage H M) : Prop :=
  L.logLikelihoodRatioDefined ∧ L.thresholdChosen ∧ L.asymptoticDistributionIdentified

theorem likelihood_ratio_test_closed_from_evidence
    {A : AdmissibleClass} {H : HypothesisTestPackage A} {M : MarkovChainTestPackage H}
    (L : LikelihoodRatioTestPackage H M) (E : LikelihoodRatioTestEvidence L) :
    LikelihoodRatioTestClosed L := by
  exact And.intro E.logLikelihoodRatioDefinedEvidence
    (And.intro E.thresholdChosenEvidence E.asymptoticDistributionIdentifiedEvidence)

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse