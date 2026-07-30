import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  susceptibleGroup : Type u
  infectedGroup : Type v
  recoveredGroup : Type w
  population : Nat
  transmissionCoefficient : Float
  recoveryRate : Float
  birthRate : Float
  diseaseInducedDeathRate : Float
  vaccinationRate : Float

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  susceptibleGroupClosed : C.susceptibleGroup
  infectedGroupClosed : C.infectedGroup
  recoveredGroupClosed : C.recoveredGroup
  populationClosed : C.population > 0
  transmissionCoefficientClosed : C.transmissionCoefficient > 0
  recoveryRateClosed : C.recoveryRate > 0
  birthRateClosed : C.birthRate ≥ 0
  diseaseInducedDeathRateClosed : C.diseaseInducedDeathRate ≥ 0
  vaccinationRateClosed : C.vaccinationRate ≥ 0

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.population > 0 ∧ C.transmissionCoefficient > 0 ∧ C.recoveryRate > 0 ∧
  C.birthRate ≥ 0 ∧ C.diseaseInducedDeathRate ≥ 0 ∧ C.vaccinationRate ≥ 0

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.populationClosed
    (And.intro E.transmissionCoefficientClosed
      (And.intro E.recoveryRateClosed
        (And.intro E.birthRateClosed
          (And.intro E.diseaseInducedDeathRateClosed E.vaccinationRateClosed))))

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
