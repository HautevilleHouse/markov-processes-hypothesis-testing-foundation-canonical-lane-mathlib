import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean

structure MarkovTransitionKernel (S : Type u) [MeasurableSpace S] where
  source : S
  target : S
  kernel : S → Set (S → ℝ≥0∞)
  markovProperty : Prop
  fellerContinuity : Prop

structure TransitionSemigroup (S : Type u) [MeasurableSpace S] where
  kernels : ℕ → MarkovTransitionKernel S
  semigroupProperty : Prop

structure StationaryDistribution (S : Type u) [MeasurableSpace S] (k : MarkovTransitionKernel S) where
  μ : Measure S
  invariance : ∀ (s : S), μ = μ.bind (k.kernel s)

structure MarkovKernelPackage (S : Type u) [MeasurableSpace S] where
  kernel : MarkovTransitionKernel S
  semigroup : TransitionSemigroup S
  stationary : StationaryDistribution S kernel
  ergodicity : Prop

structure MarkovKernelEvidence (S : Type u) [MeasurableSpace S] (M : MarkovKernelPackage S) where
  markovPropertyClosed : M.kernel.markovProperty
  fellerContinuityClosed : M.kernel.fellerContinuity
  semigroupPropertyClosed : M.semigroup.semigroupProperty
  stationarityClosed : M.stationary.invariance
  ergodicityClosed : M.ergodicity

def MarkovKernelClosed (S : Type u) [MeasurableSpace S] (M : MarkovKernelPackage S) : Prop :=
  M.kernel.markovProperty ∧ M.kernel.fellerContinuity ∧ M.semigroup.semigroupProperty ∧ M.stationary.invariance ∧ M.ergodicity

theorem markov_kernel_closed_from_evidence (S : Type u) [MeasurableSpace S] (M : MarkovKernelPackage S) (E : MarkovKernelEvidence S M) : MarkovKernelClosed S M := by
  exact And.intro E.markovPropertyClosed (And.intro E.fellerContinuityClosed (And.intro E.semigroupPropertyClosed (And.intro E.stationarityClosed E.ergodicityClosed)))

end MarkovProcessesHypothesisTestingFoundationCanonicalLaneLean
end HautevilleHouse