import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure CompartmentModel where
  susceptible : Type u
  infected : Type v
  recovered : Type w
  transmissionRate : ℝ
  recoveryRate : ℝ
  diseaseFreeEquilibrium : Prop
  basicReproductiveNumber : ℝ

structure CompartmentModelEvidence (M : CompartmentModel) where
  transmissionRatePos : M.transmissionRate > 0
  recoveryRatePos : M.recoveryRate > 0
  diseaseFreeEquilibriumStable : M.diseaseFreeEquilibrium
  basicReproductiveNumberDefined : M.basicReproductiveNumber = M.transmissionRate / M.recoveryRate

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.transmissionRate > 0 ∧ M.recoveryRate > 0 ∧ M.diseaseFreeEquilibrium ∧
  M.basicReproductiveNumber = M.transmissionRate / M.recoveryRate

theorem compartment_model_closed_from_evidence (M : CompartmentModel) (E : CompartmentModelEvidence M) :
    CompartmentModelClosed M := by
  exact And.intro E.transmissionRatePos (And.intro E.recoveryRatePos (And.intro E.diseaseFreeEquilibriumStable E.basicReproductiveNumberDefined))

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse