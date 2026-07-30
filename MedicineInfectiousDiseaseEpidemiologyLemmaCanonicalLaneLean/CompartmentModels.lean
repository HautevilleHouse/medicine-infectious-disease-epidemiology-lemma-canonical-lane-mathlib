import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure CompartmentModel where
  susceptible : Type u
  infected : Type v
  recovered : Type w
  transmissionRate : Prop
  recoveryRate : Prop
  modelEquations : Prop

structure CompartmentModelEvidence (M : CompartmentModel) where
  transmissionRateClosed : M.transmissionRate
  recoveryRateClosed : M.recoveryRate
  modelEquationsClosed : M.modelEquations

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.transmissionRate ∧ M.recoveryRate ∧ M.modelEquations

theorem compartment_model_closed_from_evidence (M : CompartmentModel)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.transmissionRateClosed
    (And.intro E.recoveryRateClosed E.modelEquationsClosed)

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse