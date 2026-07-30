import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean.HypothesisTestingFramework

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure MarkovChainTestPackage {A : AdmissibleClass} (H : HypothesisTestPackage A) where
  transitionMatrix : Type u
  stationaryDistribution : Type v
  initialDistribution : Type w
  chainIrreducible : Prop
  chainAperiodic : Prop
  transitionMatrixDefined : Prop
  stationaryDistributionComputed : Prop
  initialDistributionSpecified : Prop
  chainIrreducibleClosed : chainIrreducible
  chainAperiodicClosed : chainAperiodic
  transitionMatrixDefinedClosed : transitionMatrixDefined
  stationaryDistributionComputedClosed : stationaryDistributionComputed
  initialDistributionSpecifiedClosed : initialDistributionSpecified

structure MarkovChainTestEvidence {A : AdmissibleClass} {H : HypothesisTestPackage A}
    (M : MarkovChainTestPackage H) where
  chainIrreducibleEvidence : M.chainIrreducible
  chainAperiodicEvidence : M.chainAperiodic
  transitionMatrixDefinedClosed : M.transitionMatrixDefined
  stationaryDistributionComputedClosed : M.stationaryDistributionComputed
  initialDistributionSpecifiedClosed : M.initialDistributionSpecified

def MarkovChainTestClosed {A : AdmissibleClass} {H : HypothesisTestPackage A}
    (M : MarkovChainTestPackage H) : Prop :=
  M.chainIrreducible ∧ M.chainAperiodic ∧ M.transitionMatrixDefined ∧
  M.stationaryDistributionComputed ∧ M.initialDistributionSpecified

theorem markov_chain_test_closed_from_evidence
    {A : AdmissibleClass} {H : HypothesisTestPackage A}
    (M : MarkovChainTestPackage H) (E : MarkovChainTestEvidence M) :
    MarkovChainTestClosed M := by
  exact And.intro E.chainIrreducibleEvidence
    (And.intro E.chainAperiodicEvidence
      (And.intro E.transitionMatrixDefinedClosed
        (And.intro E.stationaryDistributionComputedClosed E.initialDistributionSpecifiedClosed)))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse