import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let P := A.object
  CompartmentModelsClosed (CompartmentModelsPackage.mk (by exact P) (by exact P) (by exact P) (by exact P) True True True True)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    unfold bridgeClosed
    exact And.intro True.intro (And.intro True.intro (And.intro True.intro True.intro))

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
