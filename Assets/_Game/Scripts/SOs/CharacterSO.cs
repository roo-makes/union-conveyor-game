using Sirenix.OdinInspector;
using UnityEngine;

namespace _Game.Scripts
{
    [CreateAssetMenu(fileName = "Character", menuName = "UC/Character", order = 0)]
    public class CharacterSO : ScriptableObject
    {
        [Tooltip("Should be all caps")]
        public string Name;
        public bool IsPlayer;

        [Space]
        public Color CharacterIconColor;
        public Material CharacterIconMaterial;

        [Space]
        [PreviewField(100f)]
        public Sprite CharacterPortrait;
        public Material CharacterPortraitMaterial;

    }
}