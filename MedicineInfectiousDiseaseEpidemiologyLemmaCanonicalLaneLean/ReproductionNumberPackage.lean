import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean.CompartmentModelPackage

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure ReproductionNumberPackage {C : CompartmentModelPackage} where
  basicReproductionNumber : Float
  effectiveReproductionNumber : Float
  formulaDerived : Prop
  thresholdControl : Prop

structure ReproductionNumberEvidence {C : CompartmentModelPackage}
    (R : ReproductionNumberPackage C) where
  basicReproductionNumberClosed : R.basicReproductionNumber > 0
  effectiveReproductionNumberClosed : R.effectiveReproductionNumber ≥ 0
  formulaDerivedClosed : R.formulaDerived
  thresholdControlClosed : R.thresholdControl

def ReproductionNumberClosed {C : CompartmentModelPackage}
    (R : ReproductionNumberPackage C) : Prop :=
  R.basicReproductionNumber > 0 ∧ R.effectiveReproductionNumber ≥ 0 ∧
  R.formulaDerived ∧ R.thresholdControl

theorem reproduction_number_closed_from_evidence
    {C : CompartmentModelPackage} (R : ReproductionNumberPackage C)
    (E : ReproductionNumberEvidence R) : ReproductionNumberClosed R := by
  exact And.intro E.basicReproductionNumberClosed
    (And.intro E.effectiveReproductionNumberClosed
      (And.intro E.formulaDerivedClosed E.thresholdControlClosed))

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
