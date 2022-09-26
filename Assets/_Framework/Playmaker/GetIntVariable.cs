using HutongGames.PlayMaker;

namespace _Framework.Playmaker
{
    [ActionCategory("Framework")]
    [Tooltip("Gets a float from a IntVariable")]
    public class GetIntVariable : FsmStateAction
    {
        [RequiredField] [ObjectType(typeof(IntVariable))]
        public FsmObject IntVar;

        [UIHint(UIHint.Variable)] public FsmInt OutputInt;

        public override void OnEnter()
        {
            OutputInt.Value = ((IntVariable)IntVar.Value).Value;
        }
    }
}