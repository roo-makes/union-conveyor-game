using HutongGames.PlayMaker;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.InputSystem;

namespace _Game.Scripts.Dialog
{
    public class DayDialogStarter : MonoBehaviour
    {
        [SerializeField] private PlayMakerFSM _dialogFsm;

        public void StartKnot(string knot)
        {
            var eventData = new FsmEventData
            {
                StringData = knot
            };
            _dialogFsm.SendEvent("gl-startKnot");
        }
    }
}